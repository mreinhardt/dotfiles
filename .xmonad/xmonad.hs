import Data.Ratio ((%))
import System.IO

import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
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


myWorkspaces = ["1","2","3","4","5","6","7","8","9"]
myStartupHook = do
    spawnOn "1" "terminology"
    spawnOn "2" "firefox"
    spawnOn "3" "spotify"

main = do
    xmonad $
        -- XMonad config
        defaultConfig
        { borderWidth = 1
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , terminal = "terminology"
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
        -- Replace dmenu with yeganesh
          ((mod4Mask, xK_p), spawn "yeg")
        -- Alternate terminal open
        , ((mod4Mask .|. shiftMask, xK_grave), spawn "terminology")
        -- Lock screen
        , ((mod4Mask .|. shiftMask, xK_x),
           spawn "xscreensaver-command -lock")
        -- Workspace movement
        , ((mod4Mask, xK_Left), prevWS)
        , ((mod4Mask .|. shiftMask, xK_Tab), prevWS)
        , ((mod4Mask, xK_Right), nextWS)
        , ((mod4Mask, xK_Tab), nextWS)
        , ((mod4Mask .|. shiftMask, xK_Left), shiftToPrev)
        , ((mod4Mask .|. shiftMask, xK_Right), shiftToNext)
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
