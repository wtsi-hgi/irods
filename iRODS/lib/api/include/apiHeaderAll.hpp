/*** Copyright (c), The Regents of the University of California            ***
 *** For more information please refer to files in the COPYRIGHT directory ***/
/* apiHeaderAll.h - This is a script generated header file which contains
 * all the api header files */

#ifndef API_HEADER_ALL_HPP
#define API_HEADER_ALL_HPP

#include "getMiscSvrInfo.h"
#include "fileCreate.h"
#include "fileOpen.h"
#include "fileWrite.h"
#include "fileClose.h"
#include "fileLseek.h"
#include "fileRead.h"
#include "fileUnlink.h"
#include "fileMkdir.h"
#include "fileChmod.h"
#include "fileRmdir.h"
#include "fileStat.h"
#include "dataObjLock.h" // JMC - backport 4599
#include "fileGetFsFreeSpace.h"
#include "fileOpendir.h"
#include "fileClosedir.h"
#include "fileReaddir.h"
#include "dataObjCreate.h"
#include "dataObjOpen.h"
#include "dataObjRead.h"
#include "dataObjWrite.h"
#include "dataObjClose.h"
#include "dataObjPut.h"
#include "dataPut.h"
#include "dataObjGet.h"
#include "dataGet.h"
#include "dataObjRepl.h"
#include "filePut.h"
#include "fileGet.h"
#include "dataCopy.h"
#include "dataObjLseek.h"
#include "dataObjCopy.h"
#include "simpleQuery.hpp"
#include "dataObjUnlink.h"
#include "collCreate.h"
#include "generalAdmin.h"
#include "fileChksum.h"
#include "chkNVPathPerm.h"
#include "genQuery.h"
#include "authRequest.h"
#include "authResponse.h"
#include "authCheck.h"
#include "regColl.hpp"
#include "regDataObj.hpp"
#include "unregDataObj.hpp"
#include "regReplica.hpp"
#include "modDataObjMeta.hpp"
#include "modAVUMetadata.hpp"
#include "fileRename.h"
#include "modAccessControl.hpp"
#include "ruleExecSubmit.hpp"
#include "ruleExecDel.hpp"
#include "ruleExecMod.hpp"
#include "execMyRule.h"
#include "oprComplete.hpp"
#include "dataObjRename.h"
#include "dataObjRsync.h"
#include "dataObjChksum.h"
#include "phyPathReg.hpp"
#include "dataObjPhymv.h"
#include "dataObjTrim.h"
#include "objStat.h"
#include "execCmd.h"
#include "subStructFileCreate.hpp"
#include "subStructFileOpen.hpp"
#include "subStructFileRead.hpp"
#include "subStructFileWrite.hpp"
#include "subStructFileClose.hpp"
#include "subStructFileUnlink.hpp"
#include "subStructFileStat.hpp"
#include "subStructFileLseek.hpp"
#include "subStructFileRename.hpp"
#include "querySpecColl.hpp"
#include "getTempPassword.h"
#include "modColl.hpp"
#include "subStructFileMkdir.hpp"
#include "subStructFileRmdir.hpp"
#include "subStructFileOpendir.hpp"
#include "subStructFileReaddir.hpp"
#include "subStructFileClosedir.hpp"
#include "dataObjTruncate.h"
#include "fileTruncate.h"
#include "subStructFileTruncate.hpp"
#include "generalUpdate.h"
#include "getXmsgTicket.h"
#include "sendXmsg.hpp"
#include "rcvXmsg.hpp"
#include "subStructFileGet.hpp"
#include "subStructFilePut.hpp"
#include "syncMountedColl.hpp"
#include "structFileSync.hpp"
#include "openCollection.hpp"
#include "readCollection.hpp"
#include "closeCollection.h"
#include "collRepl.h"
#include "rmColl.hpp"
#include "structFileExtract.hpp"
#include "structFileExtAndReg.hpp"
#include "structFileBundle.hpp"
#include "chkObjPermAndStat.h"
#include "userAdmin.hpp"
#include "getRemoteZoneResc.h"
#include "dataObjOpenAndStat.h"
#include "l3FileGetSingleBuf.hpp"
#include "l3FilePutSingleBuf.hpp"
#include "dataObjCreateAndStat.h"
#include "fileStageToCache.h"
#include "fileSyncToArch.h"
#include "generalRowInsert.h"
#include "generalRowPurge.h"
#include "phyBundleColl.hpp"
#include "unbunAndRegPhyBunfile.hpp"
#include "getHostForPut.h"
#include "getRescQuota.h"
#include "bulkDataObjReg.h"
#include "bulkDataObjPut.h"
#include "endTransaction.h"
#include "procStat.hpp"
#include "streamRead.hpp"
#include "specificQuery.hpp"
#include "streamClose.hpp"
#include "getHostForGet.h"
#include "ticketAdmin.hpp"
#include "getTempPasswordForOther.h"
#include "getLimitedPassword.h"
#include "pamAuthRequest.hpp"
#include "sslStart.hpp"
#include "sslEnd.hpp"


// =-=-=-=-=-=-=-
// necessary for FUSE
#include "dataObjTruncate.h"
#include "fileTruncate.h"
#include "subStructFileTruncate.hpp"

// =-=-=-=-=-=-=-
// pluggable authentication
#include "authPluginRequest.h"
#include "getHierarchyForResc.h"

#endif	/* API_HEADER_ALL_H */
