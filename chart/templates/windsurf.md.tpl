# Windsurf Rules — {{ .Values.service.id }}

## Quick Guardrails
- Follow **Allowed Responsibilities**.
- Refuse changes that add **Forbidden Responsibilities**.
- Follow **Enforcement**, **Allowed Paths**, and **Hard Prohibitions**.

## Architecture
- Source of truth: {{ .Values.service.source_of_truth }}

{{- with .Values.agentops_metadata }}
{{- if .recent_changes }}
Recent changes:
{{- range .recent_changes }}
- ({{ .importance }}/10) {{ .summary }}
{{- end }}
{{- else if .change_summary }}
Change summary: {{ .change_summary }}
{{- end }}
{{- if .source_head_sha }}
Source head SHA: {{ .source_head_sha }}
{{- end }}
{{- end }}

## Canonical Service Type (Exactly One)
- **{{ .Values.canonical_service_type.chosen }}**

## Owned Responsibilities (Allowed)
Only these responsibilities may be implemented/extended in this repo.

{{- range .Values.owned_responsibilities }}
1. {{ .title }}
{{- range .evidence }}
   - Evidence: {{ . }}
{{- end }}

{{- end }}

## Forbidden Responsibilities (Prohibited)
Refuse changes that add code for any of these responsibilities.

{{- range .Values.forbidden_responsibilities }}
1. {{ .title }}
{{- range .evidence }}
   - Evidence: {{ . }}
{{- end }}

{{- end }}

## Enforcement (Mandatory)
{{- range .Values.enforcement }}
- MUST: {{ . }}
{{- end }}

## Allowed Paths (Strict)
{{- range .Values.allowed_paths }}
- {{ . }}
{{- end }}

## Hard Prohibitions (Non-Negotiable)
{{- range .Values.hard_prohibitions }}
- MUST NOT: {{ . }}
{{- end }}
