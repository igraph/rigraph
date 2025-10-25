from __future__ import annotations

from pathlib import Path
from typing import Dict, Optional, Union, TYPE_CHECKING

from stimulus.model import DocstringProvider

if TYPE_CHECKING:
    from jinja2 import Environment

__all__ = ("DocstringProvider", "FolderBasedDocstringProvider")


class FolderBasedDocstringProvider:
    """Docstring provider that returns docstrings from files in a given folder
    on the filesystem.

    The files are interpreted as Jinja2 templates so you can use all the markup
    that is valid in Jinja2.
    """

    _root: Path
    """Root folder that contains the files with the docstrongs."""

    _jinja_env: Environment
    """Jinja2 environment that resolves template names from the filesystem."""

    _cache: Dict[str, Optional[str]]

    def __init__(self, root: Union[str, Path]):
        from jinja2 import Environment, FileSystemLoader

        self._cache = {}
        self._root = Path(root)
        self._jinja_env = Environment(
            loader=FileSystemLoader(self._root),
            autoescape=False,
        )

    def __call__(self, name: str) -> Optional[str]:
        from jinja2 import TemplateNotFound

        if name not in self._cache:
            try:
                template = self._jinja_env.get_template(f"{name}.txt")
            except TemplateNotFound:
                result = None
            else:
                result = template.render(name=name)
            self._cache[name] = result

        return self._cache.get(name)
