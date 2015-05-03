# SourceGuardian-Auto-Installer
SourceGuardian auto installer for CentOS Web Panel

cd /usr/local/src

rm -rf cwp-sourceguardian.sh

wget -c http://dl-package.bullten.in/cwp/cwp-sourceguardian.sh

chmod +x cwp-sourceguardian.sh

sh cwp-sourceguardian.sh | tee /var/log/sourceguardian.log
