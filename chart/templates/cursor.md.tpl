# Cursor Rules — {{ .Values.service.id }}

## Operating Constraints (Read First)
- MUST align changes with the **Owned Responsibilities** below.
- MUST NOT implement anything in **Forbidden Responsibilities**.
- MUST obey **Enforcement**, **Allowed Paths**, and **Hard Prohibitions**.

## Architecture (Source of Truth)
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

## Canonical Service Type (Choose Exactly One)
- **{{ .Values.canonical_service_type.chosen }}**

## Owned Responsibilities (Allowed)
{{- range .Values.owned_responsibilities }}
1. {{ .title }}
{{- range .evidence }}
   - Evidence: {{ . }}
{{- end }}

{{- end }}

## Forbidden Responsibilities (Prohibited)
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
