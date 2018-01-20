taiki45/infra
=============

run:

```
./run --dry-run
./run
```

env:

- aws credential
- `ITAMAE_BUCKET`
- `ITAMAE_IP`
- `ITAMAE_PORT`

manage secrets:

```
aws s3 sync "s3://${ITAMAE_BUCKET}/secrets" secrets
# edit
aws s3 sync secrets "s3://${ITAMAE_BUCKET}/secrets"
```

pi:

- Change password
- start sshd
