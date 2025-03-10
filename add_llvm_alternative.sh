# install alternative versions of llvm
# after that, user `sudo update-alternatives --config llvm-config` to configure which llvm to use.
sudo update-alternatives --install \
        /usr/bin/llvm-config       llvm-config      /usr/bin/llvm-config-18  200 \
--slave /usr/bin/llvm-ar           llvm-ar          /usr/bin/llvm-ar-18 \
--slave /usr/bin/llvm-as           llvm-as          /usr/bin/llvm-as-18 \
--slave /usr/bin/llvm-bcanalyzer   llvm-bcanalyzer  /usr/bin/llvm-bcanalyzer-18 \
--slave /usr/bin/llvm-cov          llvm-cov         /usr/bin/llvm-cov-18 \
--slave /usr/bin/llvm-diff         llvm-diff        /usr/bin/llvm-diff-18 \
--slave /usr/bin/llvm-dis          llvm-dis         /usr/bin/llvm-dis-18 \
--slave /usr/bin/llvm-dwarfdump    llvm-dwarfdump   /usr/bin/llvm-dwarfdump-18 \
--slave /usr/bin/llvm-extract      llvm-extract     /usr/bin/llvm-extract-18 \
--slave /usr/bin/llvm-link         llvm-link        /usr/bin/llvm-link-18 \
--slave /usr/bin/llvm-mc           llvm-mc          /usr/bin/llvm-mc-18 \
--slave /usr/bin/llvm-mcmarkup     llvm-mcmarkup    /usr/bin/llvm-mcmarkup-18 \
--slave /usr/bin/llvm-nm           llvm-nm          /usr/bin/llvm-nm-18 \
--slave /usr/bin/llvm-objdump      llvm-objdump     /usr/bin/llvm-objdump-18 \
--slave /usr/bin/llvm-ranlib       llvm-ranlib      /usr/bin/llvm-ranlib-18 \
--slave /usr/bin/llvm-readobj      llvm-readobj     /usr/bin/llvm-readobj-18 \
--slave /usr/bin/llvm-rtdyld       llvm-rtdyld      /usr/bin/llvm-rtdyld-18 \
--slave /usr/bin/llvm-size         llvm-size        /usr/bin/llvm-size-18 \
--slave /usr/bin/llvm-stress       llvm-stress      /usr/bin/llvm-stress-18 \
--slave /usr/bin/llvm-symbolizer   llvm-symbolizer  /usr/bin/llvm-symbolizer-18 \
--slave /usr/bin/llvm-tblgen       llvm-tblgen      /usr/bin/llvm-tblgen-18 \
