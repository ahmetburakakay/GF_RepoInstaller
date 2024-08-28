#!/bin/bash

# Set the target directory for the gf-patterns
mkdir -p "$HOME/.gf"
TARGET_DIR="$HOME/.gf"

# Clone each repository and search for JSON patterns
for repo in \
    "https://github.com/tomnomnom/gf" \
    "https://github.com/r00tkie/grep-pattern" \
    "https://github.com/mrofisr/gf-patterns" \
    "https://github.com/robre/gf-patterns" \
    "https://github.com/1ndianl33t/Gf-Patterns" \
    "https://github.com/dwisiswant0/gf-secrets" \
    "https://github.com/bp0lr/myGF_patterns" \
    "https://github.com/cypher3107/GF-Patterns" \
    "https://github.com/Matir/gf-patterns" \
    "https://github.com/Isaac-The-Brave/GF-Patterns-Redux" \
    "https://github.com/arthur4ires/gfPatterns" \
    "https://github.com/R0X4R/Garud" \
    "https://github.com/cypher3107/GF-Patterns" \
    "https://github.com/seqrity/Allin1gf" \
    "https://github.com/Jude-Paul/GF-Patterns-For-Dangerous-PHP-Functions" \
    "https://github.com/NitinYadav00/gf-patterns" \
    "https://github.com/scumdestroy/YouthCrew-GF-Patterns" \
    "https://github.com/lutfumertceylan/top25-parameter" \
    "https://github.com/g0ldencybersec/sus_params"
do
    # Check if the repository is public
    if curl -s -I "$repo" | grep -q "HTTP/.* 200"; then
        # Clone the repository with --depth 1 option to only download the latest commit
        echo "Cloning $repo"
        git clone --depth 1 "$repo"

        # Search for JSON patterns recursively and move them to the target directory
        find . -name "*.json" -exec mv {} "$TARGET_DIR" \; 2>/dev/null
        find . -name "*.JSON" -exec mv {} "$TARGET_DIR" \; 2>/dev/null
        find . -name "*.geojson" -exec mv {} "$TARGET_DIR" \; 2>/dev/null
        find . -name "*.GeoJSON" -exec mv {} "$TARGET_DIR" \; 2>/dev/null

        # Remove the cloned repository
        echo "Removing $(basename "$repo")"
        rm -rf "$(basename "$repo" .git)"
    else
        echo "$repo is no longer public or has been deleted, skipping."
    fi
done

# To be sure that a normal user and root user can reach all json files. If you did not remember, then just do not remove it, just let it execute.
sudo cp -r /root/.gf/* /home/kali/.gf/
sudo cp -r /home/kali/.gf/* /root/.gf/
