c = c
config = config

config.load_autoconfig()
config.source('tokyonight.py')
config.set("colors.webpage.darkmode.enabled", True)

c.auto_save.session = True

config.bind('tT', 'config-cycle tabs.position top left')
