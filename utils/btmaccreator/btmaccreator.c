#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <cutils/properties.h>
#include <private/android_filesystem_config.h>
#include <cutils/log.h>

#define LOG_TAG "btmaccreator"

const char MACADDR_PROP_NAME[] = "persist.wlan.macaddr";
const char BDADDR_FILE[] = "/data/misc/bluetooth/bdaddr";

int main() {
    char wifi_mac[PROPERTY_VALUE_MAX] = {'\0'};
    unsigned char hw[3];
    unsigned int addr;
    size_t i;
    int ret;
    int fp = -1;
    unsigned int sum = 0;
    char bt_mac[24];

    property_get(MACADDR_PROP_NAME, wifi_mac, NULL);
    if (! strlen(wifi_mac)) {
        ALOGE("Unable to fetch WiFi MAC from property %s", MACADDR_PROP_NAME);
	return EXIT_FAILURE;
    }

    /* Only device part matters. Vendor part in MAC should not be touched. */
    ret = sscanf(wifi_mac + 9, "%hhx:%hhx:%hhx", &hw[0], &hw[1], &hw[2]);
    if (ret != sizeof(hw)) {
        ALOGE("Failed to parse WiFi MAC address %s\n", wifi_mac);
        return EXIT_FAILURE;
    }

    for (i = 0; i < sizeof(hw); ++i)
    sum += hw[i] << (8 * (sizeof(hw) - 1 - i));

    /* Bluetooth MAC address will be (the address of WiFi) - 1 */
    --sum;

    memset(bt_mac, 0, sizeof(bt_mac));
    /* Append vendor part first */
    strncpy(bt_mac, wifi_mac, 9);

    /* Then, the device part */
    snprintf(bt_mac + 9, sizeof(bt_mac) - 9, "%.2x:%.2x:%.2x",
         sum >> (8 * 2) & 0xff,
         sum >> (8 * 1) & 0xff,
         sum >> (8 * 0) & 0xff);

    ALOGD("Bluetooth MAC address: %s\n", bt_mac);

    fp = open(BDADDR_FILE, O_WRONLY | O_CREAT | O_TRUNC, S_IRWXU);
    if (fp < 0) {
	ALOGE("Failed to open %s: %s", BDADDR_FILE, strerror(errno));
	return EXIT_FAILURE;
    }
    write(fp, bt_mac, strlen(bt_mac));
    close(fp);
    fp = -1;

    chmod(BDADDR_FILE, S_IRUSR);
    chown(BDADDR_FILE, AID_BLUETOOTH, AID_BLUETOOTH);

    return EXIT_SUCCESS;
}
