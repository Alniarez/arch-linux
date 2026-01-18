#!/usr/bin/env fish

echo "GitHub SSH key setup"
echo --------------------
echo

# Defaults
set default_key_type ed25519
set default_key_path ~/.ssh/id_ed25519
set default_comment "$USER@$(hostname)"

# Ask for key type
read -P "Key type [$default_key_type]: " key_type
if test -z "$key_type"
    set key_type $default_key_type
end

# Ask for key path
read -P "Key path [$default_key_path]: " key_path
if test -z "$key_path"
    set key_path $default_key_path
end

# Ask for comment
read -P "Key comment [$default_comment]: " comment
if test -z "$comment"
    set comment $default_comment
end

echo
echo "Summary:"
echo "  Type:    $key_type"
echo "  Path:    $key_path"
echo "  Comment: $comment"
echo

# Ensure ~/.ssh exists
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Handle existing key
if test -f $key_path
    echo "An SSH key already exists at:"
    echo "  $key_path"
    read -P "Reuse this key? (y/N): " reuse
    if not string match -qi y $reuse
        echo "Aborting. No changes made."
        exit 1
    end
else
    read -P "Generate new SSH key? (y/N): " generate
    if not string match -qi y $generate
        echo "Aborting. No changes made."
        exit 1
    end

    ssh-keygen -t $key_type -C "$comment" -f $key_path
end

# Start ssh-agent if needed
if not set -q SSH_AUTH_SOCK
    echo "Starting ssh-agent..."
    eval (ssh-agent -c)
end

# Add key to agent
ssh-add $key_path

# Show public key
echo
echo "Your public SSH key:"
echo ----------------------------------------
cat $key_path.pub
echo ----------------------------------------

# Copy to clipboard if possible
if type -q wl-copy
    cat $key_path.pub | wl-copy
    echo "Public key copied to clipboard (Wayland)"
end

echo
echo "Add this key to GitHub:"
echo "https://github.com/settings/keys"
echo
echo "Done."
