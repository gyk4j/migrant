package command

import (
	"fmt"
)

const (
	Help = "help"
	Status = "status"
	GlobalStatus = "global-status"
	Version = "version"
	Init = "init"
	Up = "up"
	Ssh = "ssh"
	Reload = "reload"
	Provision = "provision"
	Halt = "halt"
	Destroy = "destroy"
)

type CmdFactory struct {
	cmds map[string]Runnable
}

func NewCmdFactory() (*CmdFactory, error) {
	cmds := make(map[string]Runnable)
	
	var cmd Runnable

	cmd, _ = newHelpCmd(Help)
  cmds[cmd.getName()] = cmd

  cmd, _ = newStatusCmd(Status)
  cmds[cmd.getName()] = cmd

  cmd, _ = newGlobalStatusCmd(GlobalStatus)
  cmds[cmd.getName()] = cmd

  cmd, _ = newVersionCmd(Version)
  cmds[cmd.getName()] = cmd

  cmd, _ = newInitCmd(Init)
  cmds[cmd.getName()] = cmd

  cmd, _ = newUpCmd(Up)
  cmds[cmd.getName()] = cmd

  cmd, _ = newSshCmd(Ssh)
  cmds[cmd.getName()] = cmd

  cmd, _ = newReloadCmd(Reload)
  cmds[cmd.getName()] = cmd

  cmd, _ = newProvisionCmd(Provision)
  cmds[cmd.getName()] = cmd

  cmd, _ = newHaltCmd(Halt)
  cmds[cmd.getName()] = cmd

  cmd, _ = newDestroyCmd(Destroy)
  cmds[cmd.getName()] = cmd

	f := &CmdFactory{
		cmds: cmds,
	}
	return f, nil
}

func (f *CmdFactory) Run(cmd string, args []string) (string, error) {
	var status string
	var err error

	c := f.cmds[cmd]

	if c != nil {
    c.run(args)
		status = ""
		err = nil
  } else {
    status = ""
		err = fmt.Errorf("Invalid sub-command: %s", cmd)
  }

	return status, err
}

