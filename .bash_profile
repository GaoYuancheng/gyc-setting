alias cm='code D:/git-repo-m'
alias cw='code D:/git-repo-w'
alias cdcm='cd D:/git-repo-m'
alias cdcw='cd D:/git-repo-w'

alias rmn='rm -rf node_modules'

# origin/feature/gyc-syncImage@20231110 -t 分割符 -k 分割完后序号 -r 倒序
alias gycBranch="git branch -r | grep 'gyc' | sort -t '@' -k 2 -r"
alias gycbranch="gycBranch"

# 测试
alias alias-test='echo success'

# 运行 pnpm run start，如果失败则运行 pnpm run start-test05
# s1函数：按顺序尝试执行多个pnpm命令，直到一个成功为止
s1() {
    # 定义要尝试的命令数组，按优先级排序
    local commands=("start" "start-test05" "start-test04" "start-test03" "start-test02" "start-test01")
    ~
    # 遍历命令数组中的每个命令
    for cmd in "${commands[@]}"; do
        echo "尝试运行 pnpm run $cmd..."  # 输出当前尝试的命令
        result=$(pnpm run $cmd)
        if [[ $? -eq 0 && ! "$result" =~ "ERR_PNPM_NO_SCRIPT" && ! "$result" =~ "ERR_PNPM_NO_SCRIPT_OR_SERVER" ]]; then  # 检查命令退出状态和结果内容
            echo "pnpm run $cmd 成功执行"  # 如果成功，输出成功信息
            return 0                      # 返回成功状态码并退出函数
        # else
        #     echo "pnpm run $cmd 失败"      # 如果失败，输出失败信息
        #     # 如果不是最后一个命令，继续尝试下一个
        #     if [ "$cmd" != "${commands[-1]}" ]; then
        #         echo "尝试下一个命令..."    # 提示将尝试下一个命令
        #     fi
        fi
    done
    
    # 如果所有命令都失败，输出总体失败信息
    echo "所有命令都执行失败"
    return 1                              # 返回失败状态码
}


# gitclone 之后自动打开项目
gitclone (){
    # 检查参数是否存在
    if [ $# -ne 1 ]; then
        echo "用法: $0 <仓库URL>"
        exit 1
    fi

    REPO_URL="$1"
    DIR_NAME=$(basename "$REPO_URL" .git)  # 自动去除.git后缀

    # 执行克隆操作
    echo "正在克隆仓库: $REPO_URL"
    git clone "$REPO_URL"

    # 检查克隆是否成功
    if [ $? -eq 0 ]; then
        echo "克隆成功，正在进入目录: $DIR_NAME"
        cd "$DIR_NAME" && code .
        # 显示当前目录确认
        pwd
    else
        echo "错误：仓库克隆失败"
    fi
}

mcd () { 
    mkdir -p $1 
    cd $1
}

# 函数测试
function show(){
    echo "Hello word"
    echo $1
}

