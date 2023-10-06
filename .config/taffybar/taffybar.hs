{-# LANGUAGE OverloadedStrings #-}
import System.Taffybar
import System.Taffybar.Information.CPU
import System.Taffybar.SimpleConfig
import System.Taffybar.Widget
import System.Taffybar.Widget.Generic.Icon

cpuCallback = do
  (_, systemLoad, totalLoad) <- cpuLoad
  return [ totalLoad, systemLoad ]

myClockConfig = defaultClockConfig
  { clockFormatString = " %R %d/%m/%y "
  }
  
myWorkspaceConfig = defaultWorkspacesConfig
  { maxIcons = Just 1
  }

main = do

  let clock = textClockNewWith myClockConfig
      clockIcon = iconImageWidgetNew ".config/taffybar/icons/clock.png"
      cpu = textCpuMonitorNew " $total$% " 1
      cpuIcon = iconImageWidgetNew ".config/taffybar/icons/cpu.png"
      mem = textMemoryMonitorNew " $used$ " 1
      memIcon = iconImageWidgetNew ".config/taffybar/icons/memory.png"
      workspaces = workspacesNew myWorkspaceConfig
      tray = sniTrayThatStartsWatcherEvenThoughThisIsABadWayToDoIt >>= buildPadBox
      simpleConfig = defaultSimpleTaffyConfig
                       { startWidgets = [ workspaces ]
                       , endWidgets = [ clock, clockIcon, cpu, cpuIcon, mem, memIcon, tray ]
                       , barPosition = Top
                       , barPadding = 0
                       , widgetSpacing = 0
                       }
  simpleTaffybar simpleConfig
