{ config, lib, pkgs, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        barType = "framed";
        position = "top";
        monitors =  [];
        showOutline = false;
        showCapsule = true;
        capsuleOpacity = 0.30;
        capsuleColorKey = "secondary";
        widgetSpacing = 6;
        contentPadding = 2;
        fontScale = 1;
        enableExclusionZoneInset = false;
        backgroundOpacity = 0.93;
        useSeparateOpacity = false;
        marginVertical = 4;
        marginHorizontal = 4;
        frameThickness = 8;
        frameRadius = 12;
        outerCorners = true;
        hideOnOverview = false;
        displayMode = "always_visible";
        autoHideDelay = 500;
        autoShowDelay = 150;
        showOnWorkspaceSwitch = true;
        widgets = {
          left = [
            {
              id = "Launcher";
              colorizeSystemIcon = "secondary";
              customIconPath = "";
              icon = "rocket";
              enableColorization = false;
              iconColor = "none";
              useDistroLogo = true;
            }
            {
              characterCount = 2;
              colorizeIcons = false;
              emptyColor =  "none";
              enableScrollWheel = true;
              focusedColor = "primary";
              followFocusedScreen = false;
              fontWeight = "bold";
              groupedBorderOpacity = 1;
              hideUnoccupied = false;
              iconScale = 0.8;
              id = "Workspace";
              labelMode = "index";
              occupiedColor = "secondary";
              pillSize = 0.6;
              showApplications = false;
              showApplicationsHover = false;
              showBadge = true;
              showLabelsOnlyWhenOccupied = true;
              unfocusedIconsOpacity = 1;
            }
            {
              colorizeIcons = false;
              hideMode = "hidden";
              id = "ActiveWindow";
              maxWidth = 145;
              scrollingMode = "hover";
              showIcon = true;
              textColor = "none";
              useFixedWidth = false;
            }
            {
              id = "plugin:ssh-sessions";
            }
          ];
          center = [
            {
              compactMode = false;
              hideMode = "hidden";
              hideWhenIdle = false;
              id = "MediaMini";
              maxWidth = 145;
              panelShowAlbumArt = true;
              scrollingMode = "hover";
              showAlbumArt = true;
              showArtistFirst = true;
              showProgressRing = true;
              showVisualizer = true;
              textColor = "none";
              useFixedWidth = false;
              visualizerType = "linear";
            }
            {
              clockColor = "none";
              customFont = "";
              formatHorizontal = "h:mm AP - ddd, MMM dd";
              formatVertical = "h mm AP - dd MM";
              id = "Clock";
              tooltipFormat = "h:mm AP ddd, MMM dd";
              useCustomFont = false;
            }
            {
              id = "plugin:usb-drive-manager";
            }
          ];
          right = [
            {
              blacklist = [];
              chevronColor = "none";
              colorizeIcons = false;
              drawerEnabled = true;
              hidePassive = false;
              id = "Tray";
              pinned = [];
            }
            {
              compactMode = true;
              diskPath = "/";
              iconColor = "none";
              id = "SystemMonitor";
              showCpuCores = false;
              showCpuFreq = false;
              showCpuTemp = true;
              showCpuUsage = true;
              showDiskAvailable = false;
              showDiskUsage = true;
              showDiskUsageAsPercent = false;
              showGpuTemp = false;
              showLoadAverage = false;
              showMemoryAsPercent = true;
              showMemoryUsage = true;
              showNetworkStats = true;
              showSwapUsage = false;
              textColor = "none";
              useMonospaceFont = true;
              usePadding = false;
            }
            {
              hideWhenZero = true;
              hideWhenZeroUnread = false;
              iconColor = "none";
              id = "NotificationHistory";
              showUnreadBadge = true;
              unreadBadgeColor = "primary";
            }
            {
              deviceNativePath = "__default__";
              displayMode = "graphic";
              hideIfIdle = false;
              hideIfNotDetected = true;
              id = "Battery";
              showNoctaliaPerformance = true;
              showPowerProfiles = true;
            }
            {
              displayMode = "onhover";
              iconColor = "none";
              id = "Volume";
              middleClickCommand = "pwvucontrol || pavucontrol";
              textColor = "none";
            }
            {
              applyToAllMonitors = false;
              displayMode = "onhover";
              iconColor = "none";
              id = "Brightness";
              textColor = "none";
            }
            {
              colorizeDistroLogo = false;
              colorizeSystemIcon = "none";
              customIconPath = "";
              enableColorization = false;
              icon = "noctalia";
              id = "ControlCenter";
              useDistroLogo = false;
            }
          ];
        };
        mouseWheelAction = "none";
        reverseScroll = false;
        mouseWheelWrap = true;
        middleClickAction = "none";
        middleClickFollowMouse = false;
        middleClickCommand = "";
        rightClickAction = "controlCenter";
        rightClickFollowMouse = true;
        rightClickCommand = "";
        screenOverrides = [];
      };
      general = {
        avatarImage = "/home/zpeppler/.config/assets/profile-pic/blu.jpg";
        dimmerOpacity = 0.2;
        showScreenCorners = false;
        forceBlackScreenCorners = false;
        scaleRatio = 1;
        radiusRatio = 1;
        iRadiusRatio = 1;
        boxRadiusRatio = 1;
        screenRadiusRatio = 1;
        animationSpeed = 1;
        animationDisabled = false;
        compactLockScreen = false;
        lockScreenAnimations = false;
        lockOnSuspend = true;
        showSessionButtonsOnLockScreen = true;
        showHibernateOnLockScreen = false;
        enableLockScreenMediaControls = true;
        enableShadows = true;
        enableBlurBehind = true;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        language = "";
        allowPanelsOnScreenWithoutBar = true;
        showChangelogOnStartup = true;
        telemetryEnabled = false;
        enableLockScreenCountdown = true;
        lockScreenCountdownDuration = 10000;
        autoStartAuth = false;
        allowPasswordWithFprintd = false;
        clockStyle = "custom";
        clockFormat = "h:mm AP";
        passwordChars = false;
        lockScreenMonitors = [];
        lockScreenBlur = 0;
        lockScreenTint = 0;
        reverseScroll = false;
        smoothScrollEnabled = true;
        keybinds = {
          keyUp = [ "Up" ];
          keyDown = [ "Down" ];
          keyLeft = [ "Left" ];
          keyRight = [ "Right" ];
          keyEnter = [ "Return" "Enter" ];
          keyEscape = [ "Esc" ];
          keyRemove = [ "Del" ];
        };
      };
      ui = {
        fontDefault = "JetBrainsMono NF";
        fontFixed = "JetBrainsMono NF";
        fontDefaultScale = 0.96;
        fontFixedScale = 0.99;
        tooltipsEnabled = true;
        scrollbarAlwaysVisible = true;
        boxBorderEnabled = false;
        panelBackgroundOpacity = 0.93;
        translucentWidgets = false;
        panelsAttachedToBar = true;
        settingsPanelMode = "attached";
        settingsPanelSideBarCardStyle = true; 
      };
      location = {
        name = "North Charleston, SC";
        weatherEnabled = true;
        weatherShowEffects = true;
        useFahrenheit = true;
        use12hourFormat = true;
        showWeekNumberInCalendar = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        analogClockInCalendar = false;
        firstDayOfWeek = 0;
        hideWeatherTimezone = false;
        hideWeatherCityName = false;
      };
      calendars = {
        cards = [
          {
            id = "calendar-header-card";
            enabled = true;
          }
          {
            id = "calendar-month-card";
            enabled = true;
          }
          {
            id = "weather-card";
            enabled = true;
          }
        ];
      };
      wallpaper = {    
        enabled = true;
        overviewEnabled = false;
        directory = "/home/zpeppler/.config/assets/wallpapers";
        monitorDirectories = [];
        enableMultiMonitorDirectories = false;
        showHiddenFiles = false;
        viewMode = "single";
        setWallpaperOnAllMonitors = true;
        fillMode = "crop";
        fillColor = "#000000";
        useSolidColor = false;
        solidColor = "#1a1a2e";
        automationEnabled = false;
        wallpaperChangeMode = "random";
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = [
          "fade"
          "disc"
          "stripes"
          "wipe"
          "pixelate"
          "honeycomb"
        ];
        skipStartupTransition = false;
        transitionEdgeSmoothness = 0.05;
        panelPosition = "follow_bar";
        hideWallpaperFilenames = false;
        useOriginalImages = false;
        overviewBlur = 0.4;
        overviewTint = 0.6;
        useWallhaven = false;
        wallhavenQuery = "";
        wallhavenSorting = "relevance";
        wallhavenOrder = "desc";
        wallhavenCategories = "111";
        wallhavenPurity = "100";
        wallhavenRatios = "";
        wallhavenApiKey = "";
        wallhavenResolutionMode = "atleast";
        wallhavenResolutionWidth = "";
        wallhavenResolutionHeight = "";
        sortOrder = "name";
        favorites = [];
      };
      appLauncher = {
        enableClipboardHistory = true;
        autoPasteClipboard = false;
        enableClipPreview = true;
        clipboardWrapText = true;
        enableClipboardSmartIcons = true;
        enableClipboardChips = true;
        clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
        clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
        position = "top_left";
        pinnedApps = [];
        sortByMostUsed = true;
        terminalCommand = "footclient -e";
        customLaunchPrefixEnabled = false;
        customLaunchPrefix = "";
        viewMode = "grid";
        showCategories = true;
        iconMode = "native";
        showIconBackground = false;
        enableSettingsSearch = true;
        enableWindowsSearch = true;
        enableSessionSearch = true;
        ignoreMouseInput = false;
        screenshotAnnotationTool = "";
        overviewLayer = false;
        density = "comfortable";
      };
      controlCenter = {
        position = "top_right";
        diskPath = "/";
        shortcuts = {
          left = [
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "WallpaperSelector";
            }
            {
              id = "NoctaliaPerformance";
            }
          ];
          right = [
            {
              id = "Notifications";
            }
            {
              id = "PowerProfile";
            }
            {
              id = "KeepAwake";
            }
            {
              id = "NightLight";
            }
          ];
          cards = [
            {
              enabled = true;
              id = "profile-card";
            }
            {
              enabled = true;
              id = "shortcuts-card";
            }
            {
              enabled = true;
              id = "audio-card";
            }
            {
              enabled = false;
              id = "brightness-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
            {
              enabled = true;
              id = "media-sysmon-card";
            }
          ];
        };
      };
      systemMonitor = { 
        cpuWarningThreshold = 80;
        cpuCriticalThreshold = 90;
        tempWarningThreshold = 80;
        tempCriticalThreshold = 90;
        gpuWarningThreshold = 80;
        gpuCriticalThreshold = 90;
        memWarningThreshold = 80;
        memCriticalThreshold = 90;
        swapWarningThreshold = 80;
        swapCriticalThreshold = 90;
        diskWarningThreshold = 80;
        diskCriticalThreshold = 90;
        diskAvailWarningThreshold = 20;
        diskAvailCriticalThreshold = 10;
        batteryWarningThreshold = 20;
        batteryCriticalThreshold = 5;
        enableDgpuMonitoring = false;
        useCustomColors = false;
        warningColor = "";
        criticalColor = "";
        externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
      };
      noctaliaPerformance = {
        disableWallpaper = true;
        disableDesktopWidgets = true;
      };
      dock = {
        enabled = true;
        position = "bottom";
        displayMode = "auto_hide";
        dockType = "attached";
        backgroundOpacity = 1;
        floatingRatio = 1;
        size = 1;
        onlySameOutput = true;
        monitors = [];
        pinnedApps = [];
        colorizeIcons = false;
        showLauncherIcon = false;
        launcherPosition = "end";
        launcherUseDistroLogo = false;
        launcherIcon = "";
        launcherIconColor = "none";
        pinnedStatic = false;
        inactiveIndicators = false;
        groupApps = false;
        groupContextMenuMode = "extended";
        groupClickAction = "cycle";
        groupIndicatorStyle = "dots";
        deadOpacity = 0.6;
        animationSpeed = 1;
        sitOnFrame = true;
        showDockIndicator = false;
        indicatorThickness = 3;
        indicatorColor = "primary";
        indicatorOpacity = 0.6;
      };
      network = {
        airplaneModeEnabled = false;
        bluetoothRssiPollingEnabled = false;
        bluetoothRssiPollIntervalMs = 60000;
        networkPanelView = "wifi";
        wifiDetailsViewMode = "grid";
        bluetoothDetailsViewMode = "grid";
        bluetoothHideUnnamedDevices = false;
        disableDiscoverability = false;
        bluetoothAutoConnect = true;
      };
      sessionMenu = {
        enableCountdown = true;
        countdownDuration = 10000;
        position = "center";
        showHeader = true;
        showKeybinds = true;
        largeButtonsStyle = true;
        largeButtonsLayout = "single-row";
        powerOptions = [
          {
            action = "lock";
            command = "";
            countdownEnabled = true;
            enabled = true;
            keybind = "1";
          }
          {
            action = "suspend";
            command = "";
            countdownEnabled = true;
            enabled = true;
            keybind = "2";
          }
          {
            action = "hibernate";
            command = "";
            countdownEnabled = true;
            enabled = true;
            keybind = "3";
          }
          {
            action = "reboot";
            command = "";
            countdownEnabled = true;
            enabled = true;
            keybind = "4";
          }
          {
            action = "logout";
            command = "";
            countdownEnabled = true;
            enabled = true;
            keybind = "5";
          }
          {
            action = "shutdown";
            command = "";
            countdownEnabled = true;
            enabled = true;
            keybind = "6";
          }
          {
            action = "rebootToUefi";
            command = "";
            countdownEnabled = true;
            enabled = true;
            keybind = "7";
          }
          {
            action = "userspaceReboot";
            command = "";
            countdownEnabled = true;
            enabled = false;
            keybind = "";
          }
        ];
      };
      notifications = {
        enabled = true;
        enableMarkdown = false;
        density = "default";
        monitors = [];
        location = "top_right";
        overlayLayer = true;
        backgroundOpacity = 1;
        respectExpireTimeout = false;
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
        clearDismissed = true;
        saveToHistory = {
          low = true;
          normal = true;
          critical = true;
        };
        sounds = {
          enabled = true;
          volume = 1;
          separateSounds = false;
          criticalSoundFile = "";
          normalSoundFile = "";
          lowSoundFile = "";
          excludedApps = "discord,firefox,chrome,chromium,edge";
        };
        enableMediaToast = false;
        enableKeyboardLayoutToast = true;
        enableBatteryToast = true;
      };
      osd = {
        enabled = true;
        location = "top_right";
        autoHideMs = 2000;
        overlayLayer = true;
        backgroundOpacity = 1;
        enabledTypes = [
          0
          1
          2
        ];
        monitors = [];
      };
      audio = {
        volumeStep = 5;
        volumeOverdrive = false;
        spectrumFrameRate = 30;
        visualizerType = "linear";
        spectrumMirrored = true;
        mprisBlacklist = [];
        preferredPlayer = "";
        volumeFeedback = false;
        volumeFeedbackSoundFile = "";
      };
      brightness = {
        brightnessStep = 5;
        enforceMinimum = true;
        enableDdcSupport = false;
        backlightDeviceMappings = [];
      };
      colorSchemes = {
        useWallpaperColors = true;
        predefinedScheme = "Tokyo Night Moon";
        darkMode = true;
        schedulingMode = "off";
        manualSunrise = "06:30";
        manualSunset = "18:30";
        generationMethod = "faithful";
        monitorForColors = "";
        syncGsettings = true;
      };
      templates = {
        activeTemplates = [
          {
            enabled = true;
            id = "foot";
          }
          {
            enabled = true;
            id = "gtk";
          }
          {
            enabled = true;
            id = "btop";
          }
          {
            enabled = true;
            id = "kitty";
          }
          {
            enabled = true;
            id = "qt";
          }
          {
            enabled = true;
            id = "yazi";
          }
          {
            enabled = true;
            id = "discord";
          }
        ];
      };
      nightLight = {
        enabled = false;
        forced = false;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };
      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
        screenLock = "";
        screenUnlock = "";
        performanceModeEnabled = "";
        performanceModeDisabled = "";
        startup = "";
        session = "";
        colorGeneration = "";
      };
      plugins = {
        autoUpdate = false;
        notifyUpdates = true;
      };
      idle = {
        enabled = true;
        screenOffTimeout = 600;
        lockTimeout = 660;
        suspendTimeout = 1800;
        fadeDuration = 5;
        screenOffCommand = "";
        lockCommand = "";
        suspendCommand = "";
        resumeScreenOffCommand = "";
        resumeLockCommand = "";
        resumeSuspendCommand = "";
        customCommands = "[]";
      };
      desktopWidgets = {
        enabled = true;
        overviewEnabled = false;
        gridSnap = true;
        gridSnapScale = true;
        monitorWidgets = [
          {
            name = "eDP-1";
            widgets = [
              {
                defaultSettings = {};
                id = "plugin:sys-info-widget";
                scale = 1.1024568263156758;
                showBackground = true;
                x = 1540;
                y = 40;
              }
              {
                clockColor = "none";
                clockStyle = "minimal";
                customFont = "JetBrainsMono NF";
                format = "h:mm AP";
                id = "Clock";
                roundedCorners = true;
                scale = 1.9381800642945113;
                showBackground = true;
                useCustomFont = true;
                x = 20;
                y = 40;
              }
              {
                hideMode = "hidden";
                id = "MediaPlayer";
                roundedCorners = true;
                showAlbumArt = true;
                showBackground = true;
                showButtons = true;
                showVisualizer = true;
                visualizerType = "linear";
                x = 400;
                y = 160;
              }
              {
                id = "Weather";
                roundedCorners = true;
                scale = 1.3567846089191682;
                showBackground = true;
                x = 300;
                y = 40;
              }
              {
                defaultSettings = {
                  startOnMonday = true;
                };
                id = "plugin:calendar-widget";
                scale = 1.4400000000000002;
                showBackground = true;
                x = 20;
                y = 160;
              }
            ]; 
          }    
        ];
      };
    };
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        calendar-widget = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        keybind-cheatsheet = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        polkit-agent = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        sticky-notes = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        sys-info-widget = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        file-search = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        ssh-sessions = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        usb-drive-manager = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 2;
    };
    pluginSettings = {
      ssh-sessions = {
        terminalCommand = "footclient -e";
        pollInterval = 10;
        showInactiveHosts = true;
      };
      usb-drive-manager = {
        autoMount = true;
        fileBrowser = "yazi";
        terminalCommand = "foot";
        showNotifications = true;
        hideWhenEmpty = true;
        showBadge = true;
        iconColor = "none";
      };
    };
  };
}
