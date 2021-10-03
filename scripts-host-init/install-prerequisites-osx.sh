#!/bin/bash

echo
echo "⏳ Ensuring prerequisites..."

if ! command -v docker &> /dev/null
then
    echo
    echo "📦 installing docker..."
    brew install --cask docker
fi

if ! command -v socat &> /dev/null
then
    echo
    echo "📦 installing socat..."
    brew install socat
fi

if ! command -v Xquartz &> /dev/null
then
    echo
    echo "📦 installing xquartz..."
    brew install xquartz

    echo
    echo "⚙️ Starting XQuartz..."
    open -a Xquartz

    echo
    echo "1️⃣ Open up the preferences from the XQuartz menu and go to the last tab: security"
    echo "2️⃣ Ensure that “allow connections from network clients” is enabled."
fi

echo
echo "✅ Prerequisites satisfied."
