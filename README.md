sync-ftp
========


Requirements:
-------------------------------
This script requires lftp. To install on Mac OS X, obtain brew
<http://mxcl.github.io/homebrew/> and run the following command:

brew install lftp

That will install dependencies needed and the lftp application. An update might
be needed for this to work in which case you can run `brew update`.


Usage:
-------------------------------
```bash
./sync-ftp.sh config-file.sh source-path deploy-path
```

**Example:**
```bash
./sync-ftp.sh config/environment.sh /source/path /deploy/path
```

*Note:* See `config` directory for example.

The script will ignore *.DS_Store* and local files in the uploads directory when
deploying.

Author: Richard Sumilang <me@richardsumilang.com>
