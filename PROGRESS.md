## Wall of wins
| Date | Mission | What I built | Proof |
|------|---------|--------------|-------|
| 2026-08-28 | 1 | HTML page served from a Cloud Storage bucket | gcloud storage cat |
| 2026-08-28 | 2 | dev + test sites from one config | gcloud storage cat both buckets |
| 2026-08-30 | 3 | State in GCS, second apply blocked by lock | deleted local state, plan still clean |
| 2026-08-31 | 4 | 3 subnets + firewall from two maps in tfvars | gcloud firewall-rules describe showed both allow blocks |
| 2026-09-01 | 5 | e2-micro VM serving a templated page | curl returned "Hello from dev-tf-web" |
| 2026-09-03 | 6 | Guarded config: refused destroy, ignored drift, warned on bad region | prevent_destroy blocked destroy; check block warned |
| 2026-09-15 | 7 | 7 resources refactored into a module | plan said 0 to add, 0 to change, 0 to destroy |
| 2026-09-21 | 8 | Password stored in GCP, absent from state | grep secret_data → null; gcloud access → value |

## Log
| Date | Mission | Status | Mistakes to revisit |
|------|---------|--------|---------------------|
| 2026-08-28 | 1 | pass | |
| 2026-08-28 | 2 | pass | state is per folder, not per tfvars file |
| 2026-08-30 | 3 | pass | backend resolves before variables |
| 2026-08-31 | 4 | pass | toset() converts a list for for_each |
| 2026-09-01 | 5 | pass | boot-time egress unreliable; serial console is the ground truth |
| 2026-09-03 | 6 | pass | -refresh-only reports drift, plan reverts it |
| 2026-09-15 | 7 | pass | removed + destroy = true deletes the real resource |
| 2026-09-21 | 8 | pass | sensitive hides output, never state |

## Predict-the-plan scoreboard
28 correct / 32 attempts

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
- plan -refresh-only REPORTS drift; plan REVERTS it
- -replace refreshes everything (safe); -target narrows the view (dangerous)
- depends_on: use a reference instead whenever you can
- Precondition errors name the expression and value, not the instance — put the key in the message yourself
- Rename google_compute_firewall.allow-http -> allow_http (hyphen breaks A7 rule 3)
- removed block: destroy = false forgets it; destroy = true DELETES it
- A module declares required_providers, never a provider block
- Modules ask for a provider version range; the root decides; the lock file records
- sensitive = true hides CLI output; state still has the value in plain text
- _wo_version: Terraform can't compare a value it never stored, so it compares the version number
- IAM: _iam_member adds; _iam_binding owns a role; _iam_policy owns everything
- Killed apply leaves a stale lock → terraform force-unlock <ID>, only if the holder is dead

## Open resources in GCP
- gs://gcpsandboxgeneral-tfstate (permanent — never destroy)