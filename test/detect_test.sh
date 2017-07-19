#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testDetect()
{
    capture ${BUILDPACK_HOME}/bin/detect ${BUILD_DIR}
    assertCapturedSuccess
    assertAppDetected "GeoLite2"
}
