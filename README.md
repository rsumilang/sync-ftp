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
./sync-ftp.sh {config-file} {source-path} {deploy-path}
```

**Example:**
```bash
./sync-ftp.sh config-example /path/to/source /deploy/path
```

The config-file in this case, *config-example*, must be located in
*config/config-example.sh*. Please take a look at the example for available
options.

The script will ignore *.DS_Store* and local files in the uploads directory when
deploying.

Deploying to another environment means adding another config file to *config/*.


Author: Richard Sumilang <me@richardsumilang.com>
