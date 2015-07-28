from __future__ import print_function
import filecmp
from . import session
from .. import test
from . import settings
from .resource_suite import ResourceBase
from .. import lib
        test_file = os.path.join(self.admin.local_session_dir, 'test_file')
        lib.make_file(test_file, 4000, contents='arbitrary')
        myssize = str(os.stat(test_file).st_size)
        cat_file_into_file_n_times(test_file, sfile2, 2)
        # test basic informational icommands
        self.admin.assert_icommand("iput -K --wlock " + test_file + " " + irodshome + "/icmdtest/foo1")
        self.admin.assert_icommand("iput -kf " + test_file + " " + irodshome + "/icmdtest/foo1")
        imeta_output = imeta_popen.communicate()[0].decode()
        assert stat.S_IMODE(os.stat("/tmp/foo2").st_mode) == 0o640
        test_file = os.path.join(self.admin.local_session_dir, 'test_file')
        lib.make_file(test_file, 4000, contents='arbitrary')
        myssize = str(os.stat(test_file).st_size)
        cat_file_into_file_n_times(test_file, sfile2, 2)
            shutil.copyfile(test_file, mysfile)
        self.admin.assert_icommand("iput -K --wlock " + test_file + " " + irodshome + "/icmdtest/foo1")
        lib.execute_command(['tar', 'chf', os.path.join(dir_w, 'testx.tar'), '-C', os.path.join(dir_w, 'testx'), '.'])
        lib.execute_command(['tar', 'xvf', os.path.join(dir_w, 'testx1.tar'), '-C', os.path.join(dir_w, 'testx1')])
        compare_dirs = filecmp.dircmp(os.path.join(dir_w, 'testx'), os.path.join(dir_w, 'testx1', 'icmdtestx'))
        assert (not compare_dirs.right_only and not compare_dirs.left_only and not compare_dirs.diff_files), "Directories differ"
        compare_dirs = filecmp.dircmp(os.path.join(dir_w, 'testx'), os.path.join(dir_w, 'icmdtestzip', 'icmdtestx'))
        assert (not compare_dirs.right_only and not compare_dirs.left_only and not compare_dirs.diff_files), "Directories differ"
        compare_dirs = filecmp.dircmp(os.path.join(dir_w, 'testx'), os.path.join(dir_w, 'icmdtestgz', 'icmdtestx'))
        assert (not compare_dirs.right_only and not compare_dirs.left_only and not compare_dirs.diff_files), "Directories differ"
        compare_dirs = filecmp.dircmp(os.path.join(dir_w, 'testx'), os.path.join(dir_w, 'icmdtestbz2', 'icmdtestx'))
        assert (not compare_dirs.right_only and not compare_dirs.left_only and not compare_dirs.diff_files), "Directories differ"
        out, _ = lib.execute_command(['ils', '-L', os.path.join(irodshome, 'icmdtestbz2', 'icmdtestx', 'foo1')])
        bunfile = out.split()[-1]
        print(bunfile)
        test_file = os.path.join(self.admin.local_session_dir, 'test_file')
        lib.make_file(test_file, 4000, contents='arbitrary')
        myssize = str(os.stat(test_file).st_size)
        cat_file_into_file_n_times(test_file, sfile2, 2)
            shutil.copyfile(test_file, mysfile)
        shutil.move(sfile2, '/tmp/sfile2')
        shutil.copyfile('/tmp/sfile2', '/tmp/sfile2r')
        shutil.copyfile('/tmp/sfile2', '/tmp/sfile2r')
        assert filecmp.cmp('/tmp/sfile2', os.path.join(dir_w, 'foo5')), "Files differed"
        compare_dirs = filecmp.dircmp(mysdir, os.path.join(dir_w, 'testa'))
        assert (not compare_dirs.right_only and not compare_dirs.left_only and not compare_dirs.diff_files), "Directories differ"
        shutil.copyfile('/tmp/sfile2', '/tmp/sfile2c')
        test_file = os.path.join(self.admin.local_session_dir, 'test_file')
        lib.make_file(test_file, 4000, contents='arbitrary')
        myssize = str(os.stat(test_file).st_size)
        cat_file_into_file_n_times(test_file, sfile2, 2)
            shutil.copyfile(test_file, mysfile)
        self.admin.assert_icommand("iput -K --wlock " + test_file + " " + irodshome + "/icmdtest/foo1")
        compare_dirs = filecmp.dircmp(mysdir, os.path.join(dir_w, 'testb'))
        assert (not compare_dirs.right_only and not compare_dirs.left_only and not compare_dirs.diff_files), "Directories differ"
        self.admin.assert_icommand("iput " + test_file + " " + irodshome + "/icmdtestm/testmm/foo1")
        self.admin.assert_icommand("iput " + test_file + " " + irodshome + "/icmdtestm/testmm/foo11")
        compare_dirs = filecmp.dircmp(mysdir, os.path.join(dir_w, 'testm'))
        assert (not compare_dirs.right_only and not compare_dirs.left_only and not compare_dirs.diff_files), "Directories differ"
        compare_dirs = filecmp.dircmp(os.path.join(dir_w, 'testx'), os.path.join(dir_w, 'testt'))
        assert (not compare_dirs.right_only and not compare_dirs.left_only and not compare_dirs.diff_files), "Directories differ"
        self.admin.assert_icommand("iput " + test_file + " " + irodshome + "/icmdtestt_mcol/mydirtt/foo1mt")
        test_file = os.path.join(self.admin.local_session_dir, 'test_file')
        lib.make_file(test_file, 4000, contents='arbitrary')
        myssize = str(os.stat(test_file).st_size)
        cat_file_into_file_n_times(test_file, sfile2, 2)
        self.admin.assert_icommand("iput -K --wlock " + test_file + " " + irodshome + "/icmdtest/foo1")
        with open(lfile, 'wt') as f:
            print('012345678901234567890123456789012345678901234567890123456789012', file=f)
            cat_file_into_file_n_times(lfile, lfile1, 9)
            shutil.move(lfile1, lfile)
                shutil.move(lfile, mylfile)
            shutil.copyfile(test_file, mysfile)
        test_file = os.path.join(self.admin.local_session_dir, 'test_file')
        lib.make_file(test_file, 4000, contents='arbitrary')
        myssize = str(os.stat(test_file).st_size)
        cat_file_into_file_n_times(test_file, sfile2, 2)
            shutil.copyfile(test_file, mysfile)
        out, _ = lib.execute_command(['ils', '-L', os.path.join(irodshome, 'icmdtestp', 'sfile1')])
        bunfile = out.split()[-1]
        print(bunfile)
        test_file = os.path.join(self.admin.local_session_dir, 'test_file')
        lib.make_file(test_file, 4000, contents='arbitrary')
        myssize = str(os.stat(test_file).st_size)
        cat_file_into_file_n_times(test_file, sfile2, 2)
        self.admin.assert_icommand("irsync " + test_file + " i:" + irodshome + "/icmdtest/foo100")
        self.admin.assert_icommand("iput -R " + self.testresc + " " + test_file + " " + irodshome + "/icmdtest/foo100")
        self.admin.assert_icommand("irsync " + test_file + " i:" + irodshome + "/icmdtest/foo100")
        self.admin.assert_icommand("iput -R " + self.testresc + " " + test_file + " " + irodshome + "/icmdtest/foo200")
        test_file = os.path.join(self.admin.local_session_dir, 'test_file')
        lib.make_file(test_file, 4000, contents='arbitrary')
        myssize = str(os.stat(test_file).st_size)
        cat_file_into_file_n_times(test_file, sfile2, 2)
        self.admin.assert_icommand("iput -kf  " + test_file + "  " + irodshome + "/icmdtest1/foo1")
        self.admin.assert_icommand("irsync " + test_file + " i:" + irodshome + "/icmdtest1/foo1")
        test_file = os.path.join(self.admin.local_session_dir, 'test_file')
        lib.make_file(test_file, 4000, contents='arbitrary')
        myssize = str(os.stat(test_file).st_size)
        cat_file_into_file_n_times(test_file, sfile2, 2)
        with open(lfile, 'wt') as f:
            print('012345678901234567890123456789012345678901234567890123456789012', file=f)
            cat_file_into_file_n_times(lfile, lfile1, 9)
            shutil.move(lfile1, lfile)
                shutil.move(lfile, mylfile)
            shutil.copyfile(test_file, mysfile)
        compare_dirs = filecmp.dircmp(os.path.join(dir_w, 'testz'), myldir)
        assert (not compare_dirs.right_only and not compare_dirs.left_only and not compare_dirs.diff_files), "Directories differ"
        assert filecmp.cmp(os.path.join(myldir, 'lfile1'), os.path.join(dir_w, 'lfoo100'))
    @unittest.skipIf(test.settings.USE_SSL, 'RBUDP does not support encryption')
        test_file = os.path.join(self.admin.local_session_dir, 'test_file')
        lib.make_file(test_file, 4000, contents='arbitrary')
        myssize = str(os.stat(test_file).st_size)
        cat_file_into_file_n_times(test_file, sfile2, 2)
        with open(lfile, 'wt') as f:
            print('012345678901234567890123456789012345678901234567890123456789012', file=f)
            cat_file_into_file_n_times(lfile, lfile1, 9)
            shutil.move(lfile1, lfile)
                shutil.move(lfile, mylfile)
            shutil.copyfile(test_file, mysfile)
        compare_dirs = filecmp.dircmp(os.path.join(dir_w, 'testz'), myldir)
        assert (not compare_dirs.right_only and not compare_dirs.left_only and not compare_dirs.diff_files), "Directories differ"

def cat_file_into_file_n_times(inpath, outpath, n=1):
    with open(outpath, 'wt') as outfile:
        with open(inpath, 'r') as infile:
            for i in range(0, 2):
                infile.seek(0)
                while True:
                    data = infile.read(2**20)
                    if data:
                        print(data, file=outfile, end='')
                    else:
                        break