alias tx="tmux"
alias vim="nvim"
alias c="z"
alias g="lazygit"

alias test='1234'

alias parachute-up='aws lambda invoke \
  --function-name '\''parachute-downscale-scaler-dev'\'' \
  --invocation-type '\''Event'\'' \
  --payload $(echo '\''{"detail":{"scale":"UP"}}'\'' | base64) \
  --profile '\''domainparachute'\'' \
  /dev/null'

alias parachute-down='aws lambda invoke \
  --function-name '\''parachute-downscale-scaler-dev'\'' \
  --invocation-type '\''Event'\'' \
  --payload $(echo '\''{"detail":{"scale":"DOWN"}}'\'' | base64) \
  --profile '\''domainparachute'\'' \
  /dev/null'

alias ai='codex --approval-mode full-auto'
