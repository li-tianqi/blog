#!/bin/bash

echo "git add ..."
git add .
echo "add done"

echo "edit commit message..."

tip1="
choose type(1-9):
1. <feat>: 新增feature
2. <fix>: 修复bug
3. <docs>: 仅仅修改了文档，比如README, CHANGELOG, CONTRIBUTE等等
4. <style>: 仅仅修改了空格、格式缩进、都好等等，不改变代码逻辑
5. <refactor>: 代码重构，没有加新功能或者修复bug
6. <perf>: 优化相关，比如提升性能、体验
7. <test>: 测试用例，包括单元测试、集成测试等
8. <chore>: 改变构建流程、或者增加依赖库、工具等
9. <revert>: 回滚到上一个版本

"
echo "$tip1"

while true
do
	read type_num
	case "$type_num" in
		"1" )
			type="feat"
			break;;
		"2" )
			type="fix"
			break;;
		"3" )
			type="docs"
			break;;
		"4" )
			type="style"
			break;;
		"5" )
			type="refactor"
			break;;
		"6" )
			type="perf"
			break;;
		"7" )
			type="test"
			break;;
		"8" )
			type="chore"
			break;;
		"9" )
			type="revert"
			break;;
		* )
			echo "error type！re-select";;
	esac
done

echo "you have chosen type $type_num : $type"
# 想加上提示是否重新输入的功能

echo "input the scope (<file name> or <*>):\n"
read scope

echo "your scope is: \n $scope"

echo "input the subject (describe the changes):\n"
read subject

echo "your subject is: \n $subject"

message="$type($scope): $subject"

echo "edit message done"

echo "git commit ..."
git commit -m "$message"
echo "commit done"

echo "git push ..."
git push origin gh-pages
echo "push done"

echo "completed"
