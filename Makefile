SOURCE		= list-system-base
TARGET_DIR	= /usr/local/bin
PLATFORM	= $(shell uname -s)

install:
	if [ ! -d "${TARGET_DIR}" ]; then                                                         \
	    mkdir -p "${TARGET_DIR}"                                                            ; \
	fi                                                                                      ; \
	case "${PLATFORM}" in                                                                     \
	    Linux)                                                                                \
	        if [ -e "/etc/openwrt_release" ]; then                                            \
	            sed -e 's?^#/bin/bash?#/bin/ash?g' "${SOURCE}" > "${TARGET_DIR}/${SOURCE}" && \
	            chmod 755 "${TARGET_DIR}/${SOURCE}"                                        && \
	            ln -sf "${TARGET_DIR}/${SOURCE}" "${TARGET_DIR}/lsb_release"                ; \
	        else                                                                              \
	            echo "There should be a Linux System Base (LSB) package for this distro."   ; \
	            echo "There is no need for this script." ;                                    \
	        fi                                                                                \
	    ;;                                                                                    \
	    Darwin)                                                                               \
	        cp "${SOURCE}" "${TARGET_DIR}/${SOURCE}"                                       && \
	        chmod 755 "${TARGET_DIR}/${SOURCE}"                                            && \
	        ln -sf "${TARGET_DIR}/${SOURCE}" "${TARGET_DIR}/msb_release"                   && \
	        ln -sf "${TARGET_DIR}/${SOURCE}" "${TARGET_DIR}/lsb_release"                    ; \
	    ;;                                                                                    \
	    *)                                                                                    \
	        echo "Unknown (and unsupported) platform: ${PLATFORM}"                            \
	    ;; \
	esac
