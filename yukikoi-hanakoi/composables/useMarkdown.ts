import { ref } from "vue";
import MarkdownIt from "markdown-it";

export function useMarkdown(url: string) {
    const loading = ref(true);
    const content = ref("");
    const rendered = ref("");
    const error = ref("");

    const fetchMarkdown = async () => {
        try {
            const res = await fetch(url);
            const json = await res.json();
            if (json.content) {
                content.value = json.content;
                rendered.value = new MarkdownIt().render(json.content);
            } else {
                error.value = json.error || "未知错误";
            }
        } catch (err) {
            error.value = String(err);
        } finally {
            loading.value = false;
        }
    };

    fetchMarkdown();

    return {
        loading,
        content,
        rendered,
        error,
    };
}
