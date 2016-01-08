*obex-server-scanbackup-tode
obexscanManPage
  | manPage |
  manPage := TDManPage
    commandName: 'scan'
    sourceMethod: self name asString , '>>obexscan'
    fromString:
      'NAME
  obex scan - Scan backup file to collect collect class instance counts

SYNOPSIS
  obex scan [--dir=<backup-directory>] [--backup] <backup-file-name>
  obex scan [--limit=<sample-limit>] --sample=<class-name> <backup-file-name>
  obex scan [--limit=<sample-limit>] --ref=<class-name> <backup-file-name>

DESCRIPTION
OPTIONS
  --backup
    Make a fresh backup of the repository before running the scan

  --dir=<backup-directory>
    Use the given directory, instead of the standard backup directory.

  --sample=<class-name>
    Collect data on class instances and collect instaces of <class-name>.

  --ref=<class-name>
    Count and sample by class the references to instances of the given <class-name>. 
    The instances of the given <class-name> are derived from a previous --sample run.

  --limit=<sample-limit>
    Limit the number of objects sampled.

EXAMPLES
  obex scan sample.dbf.gz
  obex scan --backup sample.dbf.gz
  obex scan --dir=$GS_HOME/local/server/backups sample.dbf.gz

  obex scan sample.dbf.gz                 # instance counts by class
  obex view --scan=20
  obex scan --sample=String sample.dbf.gz # gather samples of String
  obex view --scan=20
  obex scan --ref=String sample.dbf.gz    # ref count by class to instances of String
  obex view --scan=20

  obex scan --limit=1000 --sample=String sample.dbf.gz

SEE ALSO
  bu --help restore
  bu --help backup
'.
  ^ manPage