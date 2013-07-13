import argument_parser, os, re, tables

const
  VERSION_STR* = "0.1.1" ## Program version as a string.
  VERSION_INT* = (major: 0, minor: 1, maintenance: 1) ## \
  ## Program version as an integer tuple.
  ##
  ## Major version changes mean significant new features or a break in
  ## commandline backwards compatibility, either through removal of switches or
  ## modification of their purpose.
  ##
  ## Minor version changes can add switches. Minor
  ## odd versions are development/git/unstable versions. Minor even versions
  ## are public stable releases.
  ##
  ## Maintenance version changes mean bugfixes or non commandline changes.

  PARAM_HELP = @["-h", "--help"]
  HELP_HELP = "Displays commandline help and exits."

  PARAM_VERSION = @["-v", "--version"]
  HELP_VERSION = "Displays the current version and exists."

  PARAM_DOIT = @["-d", "--doit", "doit"]
  HELP_DOIT = "Performs the renaming, otherwise only lists what it would do"


proc process_commandline(): tuple[doit: bool, files: seq[string]]=
  ## Parses the commandline.
  ##
  ## Returns a tuple with the doit parameter if renames are to be made, and the
  ## list of input filenames to be modified.
  var params: seq[Tparameter_specification] = @[]
  params.add(new_parameter_specification(PK_HELP,
    names = PARAM_HELP, help_text = HELP_HELP))
  params.add(new_parameter_specification(names = PARAM_VERSION,
    help_text = HELP_VERSION))
  params.add(new_parameter_specification(names = PARAM_DOIT,
    help_text = HELP_DOIT))

  let parsed = parse(params)

  if parsed.options.hasKey(PARAM_VERSION[0]):
    echo "Version ", VERSION_STR
    quit()

  if parsed.positional_parameters.len < 1:
    echo "You need to specify some input files to rename."
    echo_help(params)
    quit()

  # Quick access for verbosity level.
  result.doit = parsed.options.hasKey(PARAM_DOIT[0])
  result.files = map(parsed.positional_parameters,
    proc (x: Tparsed_parameter): string = x.str_val)


proc normalize_filename(filename: string, doit: bool) =
  ## Normalizes a filename.
  ##
  ## If the doit parameter is true, the file will be renamed. Otherwise the
  ## rename will be echoed but nothing will actually happen.
  echo filename


when isMainModule:
  let params = process_commandline()
  for filename in params.files: normalize_filename(filename, params.doit)
