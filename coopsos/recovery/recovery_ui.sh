#!/system/bin/sh
echo "Welcome to CoopsOS Recovery"
echo "1. Reboot System"
echo "2. Flash New ROM"
echo "3. Enter Developer Mode"
echo "4. Exit"
read choice
case $choice in
    1) reboot recovery ;;
    2) echo "Flash ROM option coming soon!" ;;
    3) echo "Enter Developer Key:" ;;
    4) exit ;;
    *) echo "Invalid choice!" ;;
esac
