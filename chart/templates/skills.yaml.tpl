version: 1
skills_root: {{ .Values.skills.root }}
agent: {{ .Values.skills.agent }}
{{- if .Values.skills.install }}
install:
{{- range .Values.skills.install }}
  -{{- if .source }}
    source: {{ .source }}{{- end }}{{- if .skill }}
    skill: {{ .skill }}{{- end }}{{- if .query }}
    query: {{ .query }}{{- end }}
{{- end }}
{{- else }}
install: []
{{- end }}
