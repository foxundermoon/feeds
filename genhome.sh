#!/bin/sh
cat <<EOF
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<title>Feeds</title>
</head>
<body>
<ul>
EOF
for d in $(find . -maxdepth 1 -type d | sed -e 's|^./||' -e '/^\.\|\.git$/d' | sort) ; do
	title=$(cut -f 1 "$d/index.meta")
	printf '<li><a href="%s/">%s</a></li>\n' "$d" "$title"
done
cat <<EOF
</ul>
<script src="https://cdn.jsdelivr.net/npm/ramda@0.25.0/dist/ramda.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/domo@0.5.9/lib/domo.js"></script>
<script src="index.js"></script>
EOF
cat ga.seg.htm
cat <<EOF
</body>
</html>
EOF
