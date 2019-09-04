import Data.Ratio ((%))
import System.IO

import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.PhysicalScreens
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Gaps
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace (onWorkspace, onWorkspaces)
import qualified XMonad.StackSet as W
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)


myWorkspaces = ["1:term","2:web","3:music","4:alt","5","6","7","8","9"]
myStartupHook = do
    spawnOn "1:term" "tilix"
    spawnOn "2:net" "google-chrome-stable"
    spawnOn "3:music" "spotify"
    spawnOn "4:alt" "tilix"

main = do
    xmonad $ ewmh $
        -- XMonad config
        defaultConfig
        { borderWidth = 2
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        -- , modMask = altMask
        -- , modMask = mod3Mask        -- Rebind Mod to the Right Alt key
        , terminal = "xfce4-terminal"
        , workspaces = myWorkspaces
        , normalBorderColor = "#666666"
        , focusedBorderColor = "#899CFF"
        , manageHook = manageDocks <+> manageSpawn <+> manageHook defaultConfig
        , startupHook = myStartupHook
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
        , logHook = logHook defaultConfig
        } `additionalKeys`
        [
        -- Replace dmenu with rofi
          ((mod4Mask, xK_p), spawn "rofi -fuzzy -show run")
        , ((mod4Mask .|. shiftMask, xK_p), spawn "rofi -fuzzy -show ssh")
        -- Alternate terminal open
        , ((mod4Mask .|. shiftMask, xK_grave), spawn "tilix")
        -- Lock screen
        , ((mod4Mask .|. shiftMask, xK_x),
           spawn "xscreensaver-command -lock")
        -- Workspace movement
        , ((mod4Mask, xK_Left), prevWS)
        , ((mod4Mask, xK_Right), nextWS)
        , ((mod4Mask .|. shiftMask, xK_Left), shiftToPrev)
        , ((mod4Mask .|. shiftMask, xK_Right), shiftToNext)
        -- Screen focus
        , ((mod4Mask, xK_a), onPrevNeighbour W.view)
        , ((mod4Mask, xK_o), onNextNeighbour W.view)
        , ((mod4Mask .|. shiftMask, xK_a), onPrevNeighbour W.shift)
        , ((mod4Mask .|. shiftMask, xK_o), onNextNeighbour W.shift)
        -- Volume controls
        , ((0, 0x1008FF11), spawn "amixer set Master 4-")
        , ((mod4Mask, xK_F3), spawn "amixer set Master 4-")
        , ((0, 0x1008FF13), spawn "amixer set Master 4+")
        , ((mod4Mask, xK_F4), spawn "amixer set Master 4+")
        -- Brightness controls
        , ((0, 0x1008FF03), spawn "xbacklight -5")
        , ((mod4Mask, xK_F5), spawn "xbacklight -5")
        , ((0, 0x1008FF02), spawn "xbacklight +5")
        , ((mod4Mask, xK_F6), spawn "xbacklight +5")
        -- Spotify controls
        , ((controlMask .|. shiftMask, xK_Up),
           spawn "playerctl -p spotify play")
        , ((controlMask .|. shiftMask, xK_Down),
           spawn "playerctl -p spotify pause")
        , ((controlMask .|. shiftMask, xK_Left),
           spawn "playerctl -p spotify previous")
        , ((controlMask .|. shiftMask, xK_Right),
           spawn "playerctl -p spotify next")
        ]
