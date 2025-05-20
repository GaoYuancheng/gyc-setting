alias cm='code D:/git-repo-m'
alias cw='code D:/git-repo-w'
alias cdcm='cd D:/git-repo-m'
alias cdcw='cd D:/git-repo-w'

alias rmn='rm -rf node_modules'

alias s1='pnpm run start'
alias s2='pnpm run start-test05'
alias s3='pnpm run start-test03'
alias sd='pnpm run dev:h5'
# git clone http://gitlab.pinming.org/zt24/zt24-gddn/gddn-notice-front.git
alias git-clone='gitClone'
# origin/feature/gyc-syncImage@20231110 -t 分割符 -k 分割完后序号 -r 倒序
alias gycBranch="git branch -r | grep 'gyc' | sort -t '@' -k 2 -r"
alias gycbranch="gycBranch"

# 测试
alias alias-test='echo success'

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
        cd "$DIR_NAME" 
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

