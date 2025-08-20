package command

import (
  "fmt"
  "flag"
  "os"
)

var versionCmd *flag.FlagSet

func init() {
  versionCmd = flag.NewFlagSet("version", flag.ExitOnError)
}

func Version() {
  fmt.Println("version")
  versionCmd.Parse(os.Args[2:])
}