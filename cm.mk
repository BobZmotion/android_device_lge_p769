## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/p769/p769.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := p769
PRODUCT_NAME := cm_p769
PRODUCT_BRAND := MetroPCS
PRODUCT_MODEL := LGMS769
PRODUCT_MANUFACTURER := LGE

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="MetroPCS/u2_mpcs_us/u2:4.1.2/JZO54K/LGMS76910b.4DBC6301:user/release-keys" \
    PRIVATE_BUILD_DESC="u2_mpcs_us-user 4.1.2 JZO54K LGMS76910b.4DBC6301 release-keys"

# Enable Torch
PRODUCT_PACKAGES += Torch

# SIM Toolkit
PRODUCT_PACKAGES += \
    Stk

