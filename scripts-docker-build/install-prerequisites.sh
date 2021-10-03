#!/bin/bash

echo "⚙️ Installing prerequisites..."

echo "📦 Updating apt packages..."
apt update -y

echo "📦 Installing turtlesim..."
apt install -y ros-foxy-turtlesim

echo "📦 Installing rqt..."
apt install -y ~nros-foxy-rqt*

echo "✅ Prerequisites satisfied."
