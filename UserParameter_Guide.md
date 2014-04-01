Glubix UserParameter Guide
=============================

### UserParameter=gluster.version
 - Backend script: none
 - Arguments: None
 - Description: Return glusterd version of target node.

### UserParameter=gluster.uuid
 - Backend script: glubix\_uuid.pl
 - Arguments: None
 - Description: Return UUID of target node.

### UserParameter=gluster.numpeers
 - Backend script: glubix\_numpeers.pl
 - Arguments: None
 - Description: Return number of connected peer of target node. (*result is total nodes - 1)

### UserParameter=gluster.voltype
 - Backend script: glubix\_voltype.pl
 - Arguments: gluster.voltype[VolumeName]
 - Description: Return type of specified volume.

### UserParameter=gluster.volstatus
 - Backend script: glubix\_volstatus.pl
 - Arguments: gluster.volstatus[VolumeName]
 - Description: Return status of specified volume.

### UserParameter=gluster.checkvolstatus
 - Backend script: glubix\_checkvolstatus.pl
 - Arguments: gluster.checkvolstatus[VolumeName,NumberOfBricks]
 - Description: Return status of specified volume.

### UserParameter=gluster.numbricks
 - Backend script: none
 - Arguments: gluster.numbricks[VolumeName]
 - Description: Return number of bricks of specified volume.

### UserParameter=gluster.numactivebricks
 - Backend script: none
 - Arguments: gluster.numactivebricks[VolumeName]
 - Description: Return number of active bricks of specified volume.

### UserParameter=gluster.georepstatus
 - Backend script: glubix\_georepstatus33.pl or glubix\_georepstatus34.pl
 - Arguments: gluster.georepstatus[VolumeName,SlaveURL]
 - Description: Return status of connection of Geo-Replication for specified volume. (*Please edit userparams-glubix.conf before using. You need specified script for your Gluster environment.)
    - glubix\_georepstatus33.pl for Gluster 3.3
    - glubix\_georepstatus34.pl for Gluster 3.4

