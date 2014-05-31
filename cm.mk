## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/p769/p769.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := p769
PRODUCT_NAME := cm_p769
PRODUCT_MODEL := LG769
PRODUCT_MANUFACTURER := LGE

# Enable Torch
PRODUCT_PACKAGES += Torch

# SIM Toolkit
PRODUCT_PACKAGES += \
    Stk

