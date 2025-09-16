alias cm='code D:/git-repo-m'
alias cw='code D:/git-repo-w'
alias cdcm='cd D:/git-repo-m'
alias cdcw='cd D:/git-repo-w'

alias sd='yarn dev:h5'

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
    
    # 读取package.json中的scripts部分
    if [ -f "package.json" ]; then
        # echo "正在读取package.json中的scripts..."
        # 使用jq提取所有script命令名称
      
        # 如果没有jq，使用grep和sed提取
        available_scripts=$(grep -o '"[^"]*": "' package.json | sed 's/": "//g' | sed 's/"//g')
        
        # 遍历预定义命令，检查是否在package.json中存在
        for cmd in "${commands[@]}"; do
            if echo "$available_scripts" | grep -q "^$cmd$"; then
                echo "pnpm run $cmd"
                pnpm run $cmd
                # result=$(pnpm run $cmd)
                # if [[ $? -eq 0 && ! "$result" =~ "ERR_PNPM_NO_SCRIPT" && ! "$result" =~ "ERR_PNPM_NO_SCRIPT_OR_SERVER" ]]; then
                    # echo "pnpm run $cmd 成功执行"
                    return 0
                # fi
            # else
                # echo "脚本 $cmd 在package.json中不存在，跳过"
            fi
        done
    else
        echo "当前目录下没有找到package.json文件"
        return 1
    fi
    
    # 如果所有命令都失败，输出总体失败信息
    echo "所有命令都执行失败或不存在"
    return 1
}


# gitclone 之后自动打开项目，支持 git clone 后续所有参数
gitclone (){
    # 检查参数是否存在
    if [ $# -lt 1 ]; then
        echo "用法: $0 <仓库URL> [git clone 其他参数]"
        exit 1
    fi

    REPO_URL="$1"
    DIR_NAME=$(basename "$REPO_URL" .git)  # 自动去除.git后缀

    # 检查目标文件夹是否已存在
    if [ -d "$DIR_NAME" ]; then
        echo "目录 $DIR_NAME 已存在，直接打开"
        code "$DIR_NAME"
        return 0
    fi

    # 执行克隆操作，带上所有参数
    echo "正在克隆仓库: $REPO_URL"
    git clone "$@"

    # 检查克隆是否成功
    if [ $? -eq 0 ]; then
        echo "克隆成功，即将打开目录: $(pwd)/$DIR_NAME"
        code "$DIR_NAME"
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

