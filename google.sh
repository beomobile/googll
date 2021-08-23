wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Dán authtoken vào đây (Sao chép và Ctrl + V để dán rồi nhấn Enter): " CRP
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 &>/dev/null &
echo Please wait for installing...
wget https://transfer.sh/1H19mpR/1.zip > /dev/null 2>&1
unzip 1.zip > /dev/null 2>&1
wget https://transfer.sh/1kpOhP6/rootfs.tar.xz > /dev/null 2>&1
tar -xvf rootfs.tar.xz > /dev/null 2>&1
echo "Installing QEMU (2-3m)..."
./dist/proot -S . apt install qemu-system-x86 curl -y > /dev/null 2>&1
echo Tải xuống bộ cài Windows...
curl -L -o lite10.qcow2 https://app.vagrantup.com/thuonghai2711/boxes/WindowsQCOW2/versions/1.1.3/providers/qemu.box
echo "Windows 10 x64 Lite"
echo Địa chỉ IP VNC của bạn:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Lưu ý: Sử dụng Nhấp chuột phải hoặc Ctrl + C để sao chép"
echo "Please Keep Colab Tab Open, Maximum Time 12h"
echo Script by bmbcare
./dist/proot -S . qemu-system-x86_64 -vnc :0 -hda lite10.qcow2  -smp cores=2  -m 8192M -machine usb=on -device usb-tablet > /dev/null 2>&1


