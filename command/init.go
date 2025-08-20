package command

import (
	"fmt"
	"flag"
	"os"
)

var initCmd *flag.FlagSet

func init() {
	initCmd = flag.NewFlagSet("init", flag.ExitOnError)
  // box := initCmd.String("", "", "")
}

func Init() {
  fmt.Println("init")
	initCmd.Parse(os.Args[2:])
}