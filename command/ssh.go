package command

import (
  "fmt"
)

type SshCmd struct {
  SubCmd
}

func NewSshCmd(name string) (*SshCmd, error) {
  sc, err := newSubCmd(name)
  instance := &SshCmd{
    *sc,
  }

  // Add additional flagset arguments here
  
  return instance, err
}

func (c *SshCmd) Run(args []string) {
  c.SubCmd.run(args)
  fmt.Println(c.Name)
}
