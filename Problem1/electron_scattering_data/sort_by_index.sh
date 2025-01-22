#!/bin/bash

# 遍历所有 .bin 文件
for file in electron_scattering_*.bin; do
  # 提取文件索引数字
  index=$(echo "$file" | sed -E 's/.*_index_([0-9]+)\.bin/\1/')

  # 检查索引是否为奇数或偶数并移动
  if (( index % 2 == 0 )); then
    mv "$file" even/
    echo "Moved $file to even/"
  else
    mv "$file" odd/
    echo "Moved $file to odd/"
  fi
done

echo "File sorting completed!"
