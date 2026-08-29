## Wall of wins
| Date | Mission | What I built | Proof |
|------|---------|--------------|-------|
| 2026-08-28 | 1 | HTML page served from a Cloud Storage bucket | gcloud storage cat |
| 2026-08-28 | 2 | dev + test sites from one config | gcloud storage cat both buckets |
| 2026-08-28 | 2 | pass | state is per folder, not per tfvars file |keep
| 2026-08-28 | 2 | dev + test sites from one config | gcloud storage cat both buckets |
| 2026-08-28 | 2 | pass | variable precedence order; sensitive ≠ encrypted |

## Predict-the-plan scoreboard
5 correct / 6 attempts

## Things to review
- Org policy blocks public buckets in this project (Domain Restricted Sharing)
- Free-tier VM regions: us-central1, us-west1, us-east1 only
- Five variable value sources, weakest first
- sensitive = true hides CLI output, does NOT encrypt state

## Open resources in GCP
- none