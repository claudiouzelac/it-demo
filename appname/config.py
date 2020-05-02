class DevelopmentConfig:
    DEBUG = True
    FEATURE_FLAGS = {
        'color_mixer_feature': False,
    }
    REDIS_URL = 'redis://localhost:6379'


class ProductionConfig:
    DEVELOPMENT = False
    FEATURE_FLAGS = {
        'color_mixer_feature': False,
    }
    REDIS_URL = 'redis://localhost:6379'
