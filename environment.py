import os

def get_env():
    return os.getenv('ENV', 'dev')

def load_config():
    env = get_env()
    if env == 'staging':
        import configs.staging as config
    elif env == 'prod':
        import configs.prod as config
    else:
        import configs.dev as config
    return config
