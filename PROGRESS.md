## Wall of wins
| Date | Mission | What I built | Proof |
|------|---------|--------------|-------|
| 2026-08-28 | 1 | HTML page served from a Cloud Storage bucket | gcloud storage cat |
| 2026-08-28 | 2 | dev + test sites from one config | gcloud storage cat both buckets |
| 2026-08-30 | 3 | State in GCS, second apply blocked by lock | deleted local state, plan still clean |
| 2026-08-31 | 4 | 3 subnets + firewall from two maps in tfvars | gcloud firewall-rules describe showed both allow blocks |
| 2026-09-01 | 5 | e2-micro VM serving a templated page | curl returned "Hello from dev-tf-web" |

## Log
| Date | Mission | Status | Mistakes to revisit |
|------|---------|--------|---------------------|
| 2026-08-28 | 1 | pass | |
| 2026-08-28 | 2 | pass | state is per folder, not per tfvars file |
| 2026-08-30 | 3 | pass | backend resolves before variables |
| 2026-08-31 | 4 | pass | toset() converts a list for for_each |
| 2026-09-01 | 5 | pass | boot-time egress unreliable; serial console is the ground truth |

## Predict-the-plan scoreboard
5 correct / 6 attempts

## Things to review
- Org policy blocks public buckets in this project (Domain Restricted Sharing)
- Free-tier VM regions: us-central1, us-west1, us-east1 only
- Five variable value sources, weakest first
- sensitive = true hides CLI output, does NOT encrypt state
- toset() converts a list for for_each (a list has positions, which shift)
- dynamic block iterator is named after the block label, not `each`
- Image family auto-updates => force-new VM replacement (fix in M6 with ignore_changes)
- curl hang = packets dropped (firewall); curl fast-fail = nothing listening
- gcloud compute instances get-serial-port-output = what the startup script actually did
- replace_triggered_by only when no real argument changes (unfinished demo)

## Open resources in GCP
- gs://gcpsandboxgeneral-tfstate (permanent — never destroy)