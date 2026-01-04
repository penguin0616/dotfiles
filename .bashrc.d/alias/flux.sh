#!/usr/bin/env bash
if command -v cmctl &> /dev/null; then
    source <(flux completion bash)
fi