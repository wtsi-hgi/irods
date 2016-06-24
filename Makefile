-include VERSION.tmp

include ./iRODS/config/external_versions.txt

MAKEFLAGS += --no-print-directory

.PHONY : default all epm mkdocs squeaky_clean clean libs plugins-nodb code-generation irods external docs doxygen icat icat-package icommands icommands-package resource resource-package resource postgres mysql oracle

default : external libs plugins-nodb

all : external libs plugins-nodb docs epm

icat : external libs plugins-nodb

icat-package : external libs plugins-nodb

icommands : external libs clients

icommands-package : external libs clients

resource : external libs plugins-nodb

resource-package : external libs plugins-nodb


external :
	@$(MAKE) -C external default

libs : code-generation external
	@$(MAKE) -C iRODS libs

clients : libs
	@$(MAKE) -C iRODS clients
	@$(MAKE) -C plugins api auth network

plugins-nodb : libs external irods
	@$(MAKE) -C plugins nodb

postgres : libs external
	@$(MAKE) -C postgres

mysql : libs external
	@$(MAKE) -C mysql

oracle : libs external
	@$(MAKE) -C oracle

code-generation : external
	@# generate the json derived code for the new api
	@./external/$(AVROVERSION)/build/avrogencpp \
		-n irods \
		-o ./iRODS/lib/core/include/server_control_plane_command.hpp \
		-i ./irods_schema_messaging/v1/server_control_plane_command.json


irods : libs
	@$(MAKE) -C iRODS

docs : doxygen mkdocs
	@cp -r doxygen/html/* mkdocs/html/doxygen

doxygen :
	@echo "Generating Doxygen..."
	@../doxygen/bin/doxygen Doxyfile 1> /dev/null
	@cp doxygen/doxy-boot.js doxygen/html
	@cp doxygen/custom.css doxygen/html

mkdocs :
	@echo "Generating Mkdocs..."
	@./docs/generate_icommands_md.sh
	@mkdir -p docs/doxygen
	@touch docs/doxygen/index.html
	@mkdocs build --clean
	@cp iRODS/images/* mkdocs/html/
	@find mkdocs/html -name '*.html' -type f -exec sed -i 's/TEMPLATE_IRODSVERSION/$(IRODSVERSION)/g' {} \;

epm :
	@$(MAKE) -C external epm


clean :
	@touch iRODS/config/platform.mk iRODS/config/config.mk
	@$(MAKE) -C plugins clean
	@$(MAKE) -C iRODS clean
	@$(MAKE) -C examples/microservices clean
	@$(MAKE) -C examples/resources clean
	@rm -rf doxygen/html
	@rm -rf mkdocs/html
	@rm -rf docs/icommands
	@rm -rf VERSION.json VERSION.txt VERSION.tmp

squeaky_clean : clean
	@$(MAKE) -C external clean

### Generate VERSION files based on git tree by calling `packaging/generate_version_json.py`
VERSION.json : packaging/generate_version_json.py VERSION.json.dist .git/HEAD .git/$(shell cat .git/HEAD | awk -F': ' '$$1=="ref" {print $$2}')
	@python $< > $@
ifeq ($(RUNINPLACE),1)
	@python -c "from __future__ import print_function; import datetime; import json; data=json.load(open('VERSION.json')); data['installation_time'] = datetime.datetime.utcnow().strftime( '%Y-%m-%dT%H:%M:%SZ' ); print(json.dumps(data, indent=4, sort_keys=True))" > $@.tmp
	@mv $@.tmp $@
endif

VERSION.txt : VERSION.json
	@python -c "from __future__ import print_function; import json; d = json.loads(open('$<').read()); print(d['irods_version'])" > $@

VERSION.tmp : VERSION.txt
	@(echo -n "IRODSVERSION=" && cat $<) > $@

