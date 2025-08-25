package command

import (
  "fmt"
)

type ReloadCmd struct {
  SubCmd
}

func NewReloadCmd(name string) (*ReloadCmd, error) {
  sc, err := newSubCmd(name)
  instance := &ReloadCmd{
    *sc,
  }

  // Add additional flagset arguments here
  
  return instance, err
}

func (c *ReloadCmd) Run(args []string) {
  c.SubCmd.run(args)
  fmt.Println(c.Name)
}
