#!/usr/bin/env bash

$subscriptionId = "XXXXXX-XXXXX-XXXXX-XXXX"

az ad sp create-for-rbac -n "tfuser" \
--role contributor \
--scopes /subscriptions/${subscriptionId}/resourceGroups/target-rg