#!/usr/bin/env bash
if command -v cmctl &> /dev/null; then
    source <(cmctl completion bash)
fi