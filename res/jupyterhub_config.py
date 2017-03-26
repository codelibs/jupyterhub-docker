import os
import sys

c = get_config()

c.JupyterHub.base_url = os.environ['CONTEXT_PATH']
c.JupyterHub.log_level = 10
c.JupyterHub.authenticator_class = 'oauthenticator.LocalGitHubOAuthenticator'

c.LocalGitHubOAuthenticator.create_system_users = True

c.Authenticator.whitelist = whitelist = set()
c.Authenticator.admin_users = admin = set()

join = os.path.join

here = os.path.dirname(__file__)
root = os.environ.get('OAUTHENTICATOR_DIR', here)
sys.path.insert(0, root)

with open(join(root, 'userlist')) as f:
    for line in f:
        if not line:
            continue
        parts = line.split()
        name = parts[0]
        whitelist.add(name)
        if len(parts) > 1 and parts[1] == 'admin':
            admin.add(name)

c.GitHubOAuthenticator.oauth_callback_url = os.environ['OAUTH_CALLBACK_URL']

c.Spawner.env_keep.append('LD_LIBRARY_PATH')

