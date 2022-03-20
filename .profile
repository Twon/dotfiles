
# https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script
if [[ $OSTYPE == *$1* ]]; then
export SDKROOT="`xcrun --show-sdk-path`"
fi