#!/bin/sh
mkdir -p _ghpages && \
cd _ghpages && \
remote_repo="https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" && \
remote_branch="gh-pages" && \
git init && \
git config user.name "${GITHUB_ACTOR}" && \
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com" && \
git remote add origin $remote_repo && \
git fetch --depth 1 origin && \
git checkout $remote_branch && \
rm -rf * && \
cp -r ../_site/* .  && \
git add . && \
echo -n 'Files to Commit:' && ls -l | wc -l && \
git commit -m'action build' > /dev/null 2>&1 && \
git push --force $remote_repo $remote_branch:$remote_branch > /dev/null 2>&1 && \
cd ../ && \
rm -fr _ghpages && \
echo '👍 GREAT SUCCESS!'
