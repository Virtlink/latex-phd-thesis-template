JetBrains Mono
==============
A typeface made for developers, by JetBrains.

Built by invoking these commands in the root of this repo:

```shell
git clone --depth 1 --branch v2.304 -j8 https://github.com/JetBrains/JetBrainsMono
cd JetBrainsMono/
virtualenv .venv
source .venv/bin/activate
pip install -r requirements.txt
gftools builder sources/config.yaml
cp ./fonts/otf/* ../fonts/jetbrainsmono/
```