package command

import (
  "fmt"
  "flag"
)

type SubCmd struct {
	Name string
	cmd *flag.FlagSet
}

func newSubCmd(name string) (*SubCmd, error) {
	instance := &SubCmd{
		name, 
		flag.NewFlagSet(name, flag.ExitOnError),
	}
	return instance, nil
}

type Runnable interface {
	Run(args []string)
}

func (s SubCmd) run(args []string) {
	fmt.Println("Parsing args...")
	s.cmd.Parse(args)
}